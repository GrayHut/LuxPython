def access_api(func):
    def wrapper():
        passcode=input("Enter the password: ")

        if passcode=="12345xx":
            func()
        else:
            print("Wrong password, Access denied...")

    return wrapper()

@access_api
def coin_api():
    print("The API requested is xxxxxxxxxxxxxxxxxxxx")

coin_api()


