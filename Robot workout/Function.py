import time

from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
import easygui


@library
class Function:
    def __int__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")
    @keyword
    def get_chrome_options(self):
        chrome_options = Options()
        #chrome_options.add_argument("--incognito")
        chrome_options.add_argument("--start-maximized")
        chrome_options.add_experimental_option("useAutomationExtension", False)
        chrome_options.add_experimental_option("excludeSwitches", ["enable-automation"])
        chrome_options.add_argument("--no-sandbox")
        chrome_options.add_argument("--disable-dev-shm-usage")
        chrome_options.add_argument("--disable-gpu")
        chrome_options.add_argument("--remote-debugging-pipe")
        #chrome_options.add_argument("--kiosk")
        return chrome_options

    @keyword
    def back_button(self):
        """
        Used to click back button on drill down's
        """
        self.selLib.wait_until_element_is_visible(" css:.backToDWSContext-img")
        self.selLib.click_element(" css:.backToDWSContext-img")

    @keyword
    def get_table_body(self):
        """
        Get content of table except headers
        """
        table_body = []
        body = self.selLib.get_webelements(" xpath:.//tbody//div//tr")
        print(len(body))
        for rows in body:
            print(rows)
            row_data = self.selLib.get_webelements(" xpath:.//td")
            body_data = []
            for td in row_data:
                body_data.append(td.text)
                print(td.text)
            table_body.append(tuple(body_data))
        return table_body







