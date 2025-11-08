import requests
url = 'http://127.0.0.1:5000/upload'
files = {'resume_file': ('sample_resume.txt', open('sample_resume.txt','rb'), 'text/plain')}
data = {'hr_skills': 'python, flask, api, leadership'}
print('Posting...')
r = requests.post(url, files=files, data=data, timeout=30)
print('Status:', r.status_code)
try:
    print(r.json())
except Exception:
    print(r.text)
