from flask import Flask, render_template, request, redirect, url_for
import jwt
import asyncio
from config import SECRET_KEY,ALG,FLAG
from playwright.async_api import async_playwright
import datetime
from urllib.parse import urlparse

def generate_admin_jwt():
    payload = {
        "user": "admin",
        "role": "admin",
        "exp": datetime.datetime.utcnow() + datetime.timedelta(hours=1)
    }
    return jwt.encode(payload, SECRET_KEY, algorithm=ALG)

async def visit_with_admin_cookie(url):
    token = generate_admin_jwt()
    async with async_playwright() as p:
        browser = await p.chromium.launch(headless=True)  # 模擬無頭瀏覽器
        context = await browser.new_context()

        # 設定 Cookie
        await context.add_cookies([{
            "name": "auth",
            "value": token,
            "url": url,
            "httpOnly": False,
            "secure": False,
        }])

        page = await context.new_page()
        await page.goto(url)
        await page.wait_for_timeout(1000)
        print(f"[AdminBot] 已訪問 {url}")
        await browser.close()

app = Flask(__name__)


@app.route("/")
def index():
    if request.cookies.get("auth"):
        return redirect(url_for("flag"))
    return redirect(url_for("login"))
    
@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        return redirect(url_for("login", msg="帳號或密碼不存在"))
    else:
        return render_template("login.html")

@app.route("/report", methods=["GET", "POST"])
def report():
    if request.method == "POST":
        url = request.form.get("url")
        host = urlparse(url).netloc
        if request.host != host:
            return f"Invalid Hostname"
        print(f"[問題回報] URL: {url}")

        # 啟動 Admin Bot (非同步)
        asyncio.run(visit_with_admin_cookie(url))

        return "<h2>感謝您的回報 🙏 管理員將會檢查！</h2><a href='/login'>返回登入頁面</a>"

    return render_template("report.html")


@app.route("/flag")
def flag():
    token = request.cookies.get("auth")
    if not token:
        return redirect(url_for("login", msg="未授權"))

    try:
        payload = jwt.decode(token,SECRET_KEY, algorithms=[ALG])
        print(payload)
        assert payload["role"] == "admin"
    except:
        return redirect(url_for("login",msg="JWT 認證失敗"))

    # 驗證成功 → 顯示 FLAG
    return f"<h1>{FLAG}</h1>"

if __name__ == "__main__":
    print(generate_admin_jwt())
    app.run(host="0.0.0.0",port=8888)
