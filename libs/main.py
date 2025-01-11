import requests

base_url = "https://reqres.in/api"
BASE_URL = "https://api.digikala.com/v1/search/"
HEADERS = {
    "accept": "application/json, text/plain, */*",
    "accept-language": "en-US,en;q=0.9,fa;q=0.8",
    "origin": "https://www.digikala.com",
    "referer": "https://www.digikala.com/",
    "sec-ch-ua": '"Google Chrome";v="131", "Chromium";v="131", "Not_A Brand";v="24"',
    "sec-ch-ua-mobile": "?0",
    "sec-ch-ua-platform": '"macOS"',
    "sec-fetch-dest": "empty",
    "sec-fetch-mode": "cors",
    "sec-fetch-site": "same-site",
    "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36",
    "x-web-client": "desktop",
    "x-web-optimize-response": "1",
}


def test_search_api_response(text):
    param = {
        "q": text,
        "page": 1,
    }
    response = requests.get(BASE_URL, headers=HEADERS, params=param)
    return response
