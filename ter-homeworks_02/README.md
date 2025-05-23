# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»

### Цели задания

1. Создать свои ресурсы в облаке Yandex Cloud с помощью Terraform.
2. Освоить работу с переменными Terraform.


### Чек-лист готовности к домашнему заданию

1. Зарегистрирован аккаунт в Yandex Cloud. Использован промокод на грант.
2. Установлен инструмент Yandex CLI.
3. Исходный код для выполнения задания расположен в директории [**02/src**](https://github.com/netology-code/ter-homeworks/tree/main/02/src).


### Задание 0

1. Ознакомьтесь с [документацией к security-groups в Yandex Cloud](https://cloud.yandex.ru/docs/vpc/concepts/security-groups?from=int-console-help-center-or-nav). 
Этот функционал понадобится к следующей лекции.

------
### Внимание!! Обязательно предоставляем на проверку получившийся код в виде ссылки на ваш github-репозиторий!
------

### Задание 1
В качестве ответа всегда полностью прикладывайте ваш terraform-код в git.
Убедитесь что ваша версия **Terraform** ~>1.8.4

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.
2. Создайте сервисный аккаунт и ключ. [service_account_key_file](https://terraform-provider.yandexcloud.net).
4. Сгенерируйте новый или используйте свой текущий ssh-ключ. Запишите его открытую(public) часть в переменную **vms_ssh_public_root_key**.
5. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.
6. Подключитесь к консоли ВМ через ssh и выполните команду ``` curl ifconfig.me```.
Примечание: К OS ubuntu "out of a box, те из коробки" необходимо подключаться под пользователем ubuntu: ```"ssh ubuntu@vm_ip_address"```. Предварительно убедитесь, что ваш ключ добавлен в ssh-агент: ```eval $(ssh-agent) && ssh-add``` Вы познакомитесь с тем как при создании ВМ создать своего пользователя в блоке metadata в следующей лекции.;
8. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ.

В качестве решения приложите:

- скриншот ЛК Yandex Cloud с созданной ВМ, где видно внешний ip-адрес;
- скриншот консоли, curl должен отобразить тот же внешний ip-адрес;
- ответы на вопросы.

![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_1.png)
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_2.png)
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_3.png)
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_4.png)
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_5.png)
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_6.png)
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_7.png)
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_8.png)
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_9.png)
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/d66a8f56dcc09cfef11c0bbae0e36d0ef17b105e/ter-homeworks/images/Screenshot_10.png)

```core_fraction=5``` - это гарантированная доля vCPU.
```preemptible = true``` - прерываеая ВМ

### Задание 2

1. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.
2. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 
3. Проверьте terraform plan. Изменений быть не должно. 
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/9eec6224cd39817cba566ce1ceb779863bea70ec/ter-homeworks/images/Screenshot_11.png)

### Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.
2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  ```cores  = 2, memory = 2, core_fraction = 20```. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').  ВМ должна работать в зоне "ru-central1-b"
3. Примените изменения.
![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/9eec6224cd39817cba566ce1ceb779863bea70ec/ter-homeworks/images/Screenshot_12.png)

### Задание 4

1. Объявите в файле outputs.tf **один** output , содержащий: instance_name, external_ip, fqdn для каждой из ВМ в удобном лично для вас формате.(без хардкода!!!)
2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.

![alt text](https://github.com/ArtemijFedorov/DevOps_Netology/blob/9eec6224cd39817cba566ce1ceb779863bea70ec/ter-homeworks/images/Screenshot_13.png)
### Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с НЕСКОЛЬКИМИ переменными по примеру из лекции.
2. Замените переменные внутри ресурса ВМ на созданные вами local-переменные.
3. Примените изменения.


### Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в единую map-переменную **vms_resources** и  внутри неё конфиги обеих ВМ в виде вложенного map(object).  
   ```
   пример из terraform.tfvars:
   vms_resources = {
     web={
       cores=2
       memory=2
       core_fraction=5
       hdd_size=10
       hdd_type="network-hdd"
       ...
     },
     db= {
       cores=2
       memory=4
       core_fraction=20
       hdd_size=10
       hdd_type="network-ssd"
       ...
     }
   }
   ```
3. Создайте и используйте отдельную map(object) переменную для блока metadata, она должна быть общая для всех ваших ВМ.
   ```
   пример из terraform.tfvars:
   metadata = {
     serial-port-enable = 1
     ssh-keys           = "ubuntu:ssh-ed25519 AAAAC..."
   }
   ```  
  
5. Найдите и закоментируйте все, более не используемые переменные проекта.
6. Проверьте terraform plan. Изменений быть не должно.

------