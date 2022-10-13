<p align="center">
  <span style="font-size: 32px; font-weight: bold; margin-left: 10px;">Demo Terraspace</span>
</p>

<p align="center">
  <br>
  <img src="https://terraspace.cloud/img/logos/terraspace-dark.svg"/>
  <br>
</p>

<hr>

#### Requisitos de sistema

- [Chocolate](https://chocolatey.org/install) (Solo para sistemas Windows)
- [Package Make](https://community.chocolatey.org/packages/make) (Solo para sistemas Windows)
- [Google Cloud SDK](https://cloud.google.com/sdk/docs/?hl=es-419#deb)
- [Terraform](https://www.terraform.io/downloads)
- [Terraspace](https://terraspace.cloud/docs/install/)

#### Requisitos del proyecto

1. Habilitar 2 proyectos en GCP:
    - Se necesitan 2 proyectos dentro de GPC, uno para desplegar los recursos para simulación de un ambiente y otro para realizar las pruebas dentro de él.

2. Crear cuentas de servicio:
    - Es necesario contar con las cuentas de servicio, una de cada proyecto para poder realizar las pruebas en local, si es posible colocar el permiso de owner para no entener inconvenientes en la pruebas.

3. Crear una carpeta de credenciales:
    - Crear una carpeta con el nombre **credentials** en la raiz del proyecto y colocar ambas cuentas de servicio dentro de la carpeta y reescribir sus nombres por: workshops.json (para el ambiente) y workshops.json (para pruebas).

4. Crear valor de secreto:
    - Ejecutar el comando **make generate-encryption-key** con el fin de obtener un valor valido como secreto para la encryptación del estado de terraform.

5. Crear secretos en secret manager:
    - Crear el secreto INFRA_ENCRYPTION_KEY en secret manager dentro de GCP con el valor obtenido en el paso 4, ademas tambien crear el secreto GCP_DB_PASSWORD con un valor cualquiera que representa las credenciales de BD para el stack **database**.

#### Ejecución en local

Desde cualquier terminal y desde la raíz del proyecto, seguir los siguientes pasos:

- Crear todos los recursos

  ```sh
  # Cambiar el valor de workshops-363613 por el id de tu proyecto de ambiente
  $ make up-all-local GOOGLE_PROJECT=workshops-363613
  ```

- Eliminar todos los recursos

  ```sh
  # Cambiar el valor de workshops-363613 por el id de tu proyecto de ambiente
  $ make down-all-local GOOGLE_PROJECT=workshops-363613
  ```

- Ejecutar test de un solo stack

  ```sh
  # Cambiar el valor de workshops-test-363621 por el id de tu proyecto de pruebas
  $ make test-local STACK_NAME=storage GOOGLE_PROJECT_TEST=workshops-test-363621
  ```

- Ejecutar test en todos los stacks

  ```sh
  # Cambiar el valor de workshops-test-363621 por el id de tu proyecto de pruebas
  $ make test-all-local GOOGLE_PROJECT_TEST=workshops-test-363621
  ```

- Visualizar arbol de dependencias

  ```sh
  $ make graph
  ```
