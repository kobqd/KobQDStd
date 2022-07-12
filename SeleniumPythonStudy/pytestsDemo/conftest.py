import pytest
from selenium import webdriver
from selenium.webdriver.chrome.service import Service


@pytest.fixture(scope="class")
def setup(request):
    print("executing first")
    service_obj = Service("G:\DevProgram\Selenium Course\chromedriver_win32\chromedriver.exe")
    driver = webdriver.Chrome(service=service_obj)
    driver.get("https://rahulshettyacademy.com/AutomationPractice/")
    driver.maximize_window()
    request.cls.driver = driver
    yield
    driver.close()
    print("executed last")

@pytest.fixture()
def dataLoad():
    print("user profile data is being created")
    return ["AA", "BB", "CC"]

@pytest.fixture(params=["Chrome","Firefox","IE"])
def crossBrowser(request):
    return request.param