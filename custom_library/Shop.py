from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn

@library
class Shop():

    def __init__(self):
        self.selLib = BuiltIn().get_library_instance("SeleniumLibrary")

# methode name converted into keyword name
    @keyword
    def hellow_world(self):
        print("hellow world.")

    @keyword
    def add_item_to_card_and_checkout(self, products):
        # ${elements} = Get WebElements   xpath: // h4[@class = 'card-title']
        # Get WebElements
        i = 1
        product_list = self.selLib.get_webelements("xpath://h4[@class= 'card-title']")
        for item in product_list:
            if item.text in products:
                # Click Button
                self.selLib.click_button("xpath:(//button[@class='btn btn-info'])["+str(i)+"]")
            i = i + 1
        self.selLib.click_link("xpath://a[@class='nav-link btn btn-primary']")
