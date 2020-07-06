import bcrypt

password = input('password: ')

salt = bcrypt.gensalt()
hashed = bcrypt.hashpw(password.encode('utf-8'),salt)

print(hashed)

if bcrypt.checkpw(password.encode('utf-8'), hashed):
    print("match")
else:
    print("does not match")