services:
  samba:
    image: dockurr/samba
    container_name: samba
    hostname: samba
    environment:
      NAME: "Data"
      USER: "samba"
      PASS: "secret"
    ports:
      - 445:445
    volumes:
      - ./samba:/storage
    restart: always
