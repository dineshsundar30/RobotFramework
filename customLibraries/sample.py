from robot.libraries.BuiltIn import BuiltIn
import random
 
seleniumLib = BuiltIn().get_library_instance('SeleniumLibrary')
 
 
def print_console():
    print("Hello")
 
def print_title():
 
    title = seleniumLib.get_title()
    print(title)
 
def select_month(xpath, month, date):
 
    while(seleniumLib.find_element(xpath).text != month):
        seleniumLib.find_element('//*[@id="ui-datepicker-div"]/div/a[1]/span').click()
    dateStr = f"//a[text() = {date}]"
    seleniumLib.find_element(dateStr).click()



# Library    Built_In/CustomLib.py   --> in test file we can all it like this 
