import os
from pathlib import Path

print(str((Path().parent / '.env').resolve()))
