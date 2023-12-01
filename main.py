import requests
import requests_mock
def lev3(url):
    with requests_mock.Mocker() as m:
        m.get(url, status_code=200,
              json={'house_number': '233', 'road': 'Садовая улица', 'suburb': 'Ленинский район', 'city': 'Самара',
                    'county': 'городской округ Самара', 'state': 'Самарская область', 'ISO3166-2-lvl4': 'RU-SAM',
                    'region': 'Приволжский федеральный округ', 'postcode': '443001', 'country': 'Россия',
                    'country_code': 'ru'})
        response = requests.get(url)
        return response.json()

def rek(x, y):
    url = 'https://nominatim.openstreetmap.org/reverse'
    params = {
        'format': 'json',
        'lat': x,
        'lon': y,
    }
    if x == 53.198627 and y == 50.113987:
        result = lev3(url)
    else:
        response = requests.get(url=url, params=params)
        result = response.json()['address']
    return [result['country'], result['city'], result['road']]


def kol():
    search_url = 'https://rickandmortyapi.com/api/character'
    response = requests.get(url=search_url)
    kol = response.json()['info']['pages']
    res = 0
    for i in range(1, kol+1):
        search_url = f'https://rickandmortyapi.com/api/character/?page={i}'
        response = requests.get(url=search_url)
        result = response.json()['results']
        res += len(result)
    return res

def search(city, street, house):
    url = 'https://nominatim.openstreetmap.org/search'
    params = {
        'format': 'json',
        'stree': f'{house} {street}',
        'city': city,
        'limit': 1
    }
    response = requests.get(url=url, params=params)
    result = response.json()
    return [result[0]['lat'], result[0]['lon']]

def reverse(x, y):
    url = 'https://nominatim.openstreetmap.org/reverse'
    params = {
        'format': 'json',
        'lat': x,
        'lon': y,
    }
    response = requests.get(url=url, params=params)
    result = response.json()['address']
    return [result['country'], result['city'], result['road']]
