class MobileValidate:
    @staticmethod
    def validate(mobile):
        if len(mobile) != 10 or not mobile.isdigit() or not (95 <= int(mobile[:2]) < 100):
            raise ValueError("Mobile number must be 10 digits and start between 95 and 99.")
        return "Valid mobile number"

try:
    mobile = input("Enter your mobile number: ")
    print(MobileValidate.validate(mobile))
except ValueError as e:
    print(f"Error: {e}")
