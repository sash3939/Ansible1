# Домашнее задание к занятию 1 «Введение в Ansible»

## Основная часть

1. Запустили playbook на окружении из `test.yml`, зафиксировали значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.
  <img width="934" alt="task1" src="https://github.com/user-attachments/assets/0b2352c0-8057-4a53-951e-1cb46e1353c7">

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.
  <img width="929" alt="task2" src="https://github.com/user-attachments/assets/6d5fa5f8-11d5-4f31-b088-336d15f121e6">

3. Создал окружение для проведения дальнейших испытаний.
  <img width="614" alt="task3" src="https://github.com/user-attachments/assets/a500d92e-7dbe-43cf-a0a0-c60789325bce">

4. Запустил playbook на окружении из `prod.yml`. Зафиксировал полученные значения `some_fact` для каждого из `managed host`.
Ставим докер-контейнеры centos7 и ubuntu и выполняем для них плейбук изменив значение переменнаых на deb default fact для ubuntu и el default fact для centos

  <img width="938" alt="task4" src="https://github.com/user-attachments/assets/d7f16722-a9fd-4046-8272-494b7712d63a">


5. Добавляем факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.
6. Повторно запускаем playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.
  <img width="869" alt="task5-6" src="https://github.com/user-attachments/assets/73c96bf8-7b00-4196-8f0c-8234889d2a32">

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.
   Шифруем наши файлы сообщений для каждого типа ОС с помоью Vault

   <img width="585" alt="task7-1" src="https://github.com/user-attachments/assets/476bceec-5afb-4b82-a6bf-fea9b77b4766">

   <img width="568" alt="task7-2" src="https://github.com/user-attachments/assets/43234739-8572-4d45-af04-5d8df0392322">

8. Запускаем playbook на окружении `prod.yml`. При запуске `ansible` запрашивает пароль. Убедитесь в работоспособности.

   <img width="752" alt="task8" src="https://github.com/user-attachments/assets/c0f00710-5544-4316-a430-3f74df6423f2">

9. Смотрим при помощи `ansible-doc` список плагинов для подключения. Выбираем подходящий для работы на `control node`.

   <img width="463" alt="task9" src="https://github.com/user-attachments/assets/d9dd3456-ee6e-4ed4-ae55-8eaacf6c8fdb">
    
10. В `prod.yml` добавляем новую группу хостов с именем  `local`, в ней размещаем localhost с необходимым типом подключения.

11. Запускаем playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

    <img width="733" alt="task10" src="https://github.com/user-attachments/assets/9252113b-b886-4d53-80b3-ac95ccd5c827">

    <img width="557" alt="task11" src="https://github.com/user-attachments/assets/2a74d4b5-2fc1-483b-bc51-72c6600e1309">

12. Заполните `README.md` ответами на вопросы. Сделайте `git push` в ветку `master`. В ответе отправьте ссылку на ваш открытый репозиторий с изменённым `playbook` и заполненным `README.md`.
13. Предоставьте скриншоты результатов запуска команд.

## Необязательная часть

1. При помощи `ansible-vault` расшифровали все зашифрованные файлы с переменными.

   <img width="589" alt="task12" src="https://github.com/user-attachments/assets/9d2f21f9-476c-485b-93b5-61304024dc16">

2. Зашифровали отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавили полученное значение в `group_vars/all/exmp.yml`.

   <img width="593" alt="task13-1" src="https://github.com/user-attachments/assets/24c27697-a797-493f-9acc-f8c4fe76bf0a">
   
   <img width="570" alt="task13-2" src="https://github.com/user-attachments/assets/8edacb94-3081-4969-8ffe-a43117c56a2d">

3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.

   <img width="686" alt="task14" src="https://github.com/user-attachments/assets/57193a83-0b4b-4f9d-a437-5e4624f9939b">

4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).

   <img width="721" alt="task15" src="https://github.com/user-attachments/assets/f06d3897-76c0-4f4c-87ec-550c6e5f06c7">
   
   <img width="607" alt="task15-1" src="https://github.com/user-attachments/assets/407ba1d8-83f6-4db9-9b1f-7eb2aabe3a59">
   
   <img width="544" alt="task15-2" src="https://github.com/user-attachments/assets/608fd750-9077-4f48-bd5c-69d32def7d47">

   <img width="800" alt="task15-3" src="https://github.com/user-attachments/assets/0c06e862-d1f2-4302-b218-f5c491052d25">

6. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.
   [Скрипт приложен в репозитории](https://github.com/sash3939/Ansible1/blob/main/playbook/run_ansible.sh)
7. Все изменения должны быть зафиксированы и отправлены в ваш личный репозиторий.
