import booking.constants as const
import os
from selenium import webdriver

class Booking(webdriver.Chrome):
    def __init__(self,driver_path=const.BASE_DRIVER_PATH,teardown=False):
        self.driver_path = driver_path
        self.teardown = teardown
        os.environ['PATH'] += self.driver_path
        options = webdriver.ChromeOptions()
        options.add_experimental_option('excludeSwitches', ['enable-logging'])
        super(Booking,self).__init__(options=options)
        self.implicitly_wait(15)
        self.maximize_window()

    def __exit__(self, exc_type, exc_val, exc_tb):
        if self.teardown:
            print("Exiting...")
            self.quit()

    def land_first_page(self):
        self.get(const.BASE_URL)

