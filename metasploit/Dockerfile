FROM metasploitframework/metasploit-framework:latest

# A wrapper that ensures we get useful file permissions on the output
COPY <<EOF /msfvenom.sh
#!/bin/bash
umask 011
exec /usr/src/metasploit-framework/msfvenom "\${@}"
EOF

RUN chmod 755 /msfvenom.sh

