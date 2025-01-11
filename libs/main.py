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

