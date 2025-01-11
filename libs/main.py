import requests

base_url = "https://reqres.in/api"


def try_request_users(page=1, per_page=5):
    url = f"{base_url}/users"
    params = {"page": page, "per_page": per_page}
    headers = {'Accept': 'application/json'}
    response = requests.get(url, headers=headers, params=params)
    print(f"Status Code: {response.status_code}")
    print(f"Response Body: {response.json()}")
    return response


def try_request_resource():
    url = f"{base_url}/resource/1"
    headers = {'Accept': 'application/json'}
    response = requests.get(url, headers=headers)
    print(f"Status Code: {response.status_code}")
    print(f"Response Body: {response.json()}")
    return response


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
    QUERY_PARAMS = {
        "q": "موبایل",
        "page": 2,
    }

    def test_api_response(self):
        # Send GET request
        response = requests.get(self.BASE_URL, headers=self.HEADERS, params=self.QUERY_PARAMS)

        # Assert status code is 200
        self.assertEqual(response.status_code, 200, "API did not return a 200 status code")

        # Parse response JSON
        response_data = response.json()

        # Assert response structure
        self.assertIn("status", response_data, "Response does not contain 'status'")
        self.assertEqual(response_data["status"], 200, "Status is not 200 in response data")
        self.assertIn("data", response_data, "Response does not contain 'data'")
        self.assertIn("products", response_data["data"], "Response data does not contain 'products'")
        self.assertIsInstance(response_data["data"]["products"], list, "'products' is not a list")

        for product in response_data["data"]["products"]:
            self.assertIn("id", product, "Product does not have 'id'")
            self.assertIn("title_fa", product, "Product does not have 'title_fa'")
            self.assertIn("rating", product, "Product does not have 'rating'")
