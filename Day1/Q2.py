class EmailValidator:
    @staticmethod
    def validate(email):
        if '@' not in email or not email.endswith('.com'):
            raise ValueError("Email must contain '@' and end with '.com'")
        return "Valid email"

try:
    email = input("Enter your email: ")
    print(EmailValidator.validate(email))
except ValueError as e:
    print(f"Error: {e}")
