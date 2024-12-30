sudo apt install x11vnc

touch /lib/systemd/system/x11vnc.service
echo -e '[Unit]\n\
Description=x11vnc service\n\
After=display-manager.service network.target syslog.target\n\
\n\
[Service]\n\
Type=simple\n\
ExecStart=/usr/bin/x11vnc -forever -display :0 -auth guess -passwd password\n\
ExecStop=/usr/bin/killall x11vnc\n\
Restart=on-failure\n\
\n\
[Install]\n\
WantedBy=multi-user.target' | sudo tee /lib/systemd/system/x11vnc.service > /dev/null

systemctl daemon-reload
systemctl enable x11vnc.service
systemctl start x11vnc.service
systemctl status x11vnc.service
