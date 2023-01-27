from jose import jwt, JWTError
from datetime import datetime, timedelta
from typing import Union

import config

_ALGORITHM = 'HS256'


def gen_token(user_id: int, active_for: timedelta) -> str:
    return jwt.encode(
        {
            "usr": user_id,
            "exp": datetime.utcnow() + active_for
        },
        key = config.TOKEN_SECRET,
        algorithm = _ALGORITHM
    )


# returns none on invalid or no longer valid token
def get_user_from_token(token: str) -> Union[int, None]:
    try:
        return jwt.decode(token, key = config.TOKEN_SECRET, algorithms = _ALGORITHM).get("usr", None)
    except JWTError:
        return None
