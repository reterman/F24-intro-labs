terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  zone = "ru-central1-a"  # Зона доступности
   folder_id = "b1grbf7oegee2lbmcvga"
  token = "t1.9euelZqVic-aiseRnJibmZjIk8-Xiu3rnpWamc-UkYqYlJbLnI_Lz5bJipfl8_cESFlI-e8IPghA_d3z90R2Vkj57wg-CED9zef1656VmoyUzMyVy5TGi5WTycmTlcaP7_zF656VmoyUzMyVy5TGi5WTycmTlcaP.B5CjDCEC1a11Upr9uUH0EpX_ZjjZAZwmjdx60HEF89byPwTB4HqA0iS_93ZFDeF1nHKfeKJud6fNmmE_G3qBCw"
}

resource "yandex_compute_instance" "nginx_instance" {
  name        = "nginx-instance"
  platform_id = "standard-v1"
  resources {
    cores  = 2
    memory = 2
  }
  boot_disk {
    initialize_params {
      image_id = "fd887hnjgjqcr2cv947t" # ID образа Nginx
    }
  }
  network_interface {
    subnet_id = "b1go8f0bt0tvemj95k9f"  # Идентификатор вашей подсети
    nat       = true
  }
}

