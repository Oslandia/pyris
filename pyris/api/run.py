# -*- coding: utf-8 -*-
from pyris.api import create_app

app = create_app()

if __name__ == "__main__":
    app.run(port=5555, debug=True)
