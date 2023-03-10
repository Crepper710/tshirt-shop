from dotenv import load_dotenv
from os import environ as env

load_dotenv('.env')


POSTGRES_USER = env.get("T_SHIRT_SHOP_POSTGRES_USER", "")
POSTGRES_PASSWORD = env.get("T_SHIRT_SHOP_POSTGRES_PASSWORD", "")
POSTGRES_ADDRESS = env.get("T_SHIRT_SHOP_POSTGRES_ADDRESS", "")
POSTGRES_DB = env.get("T_SHIRT_SHOP_POSTGRES_DB", "")
# generate with: '%030x' % random.randrange(16**64)
TOKEN_SECRET = env.get("T_SHIRT_SHOP_TOKEN_SECRET", "")
