echo "#!/bin/bash

URL="google.com"

echo "Checking $$URL"

ping -c2 $$URL
" >> check_url.sh


chmod +x *.sh