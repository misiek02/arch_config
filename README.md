# Dotfiles

Repozytorium zawierajace pliki konfiguracyjne systemu Arch Linux i srodowiska Hyprland. Zarzadzanie konfiguracja odbywa sie za pomoca narzedzia GNU Stow.

## Dodawanie nowej konfiguracji

1. Utworz folder dla nowej aplikacji odzwierciedlajacy sciezke wzgledem katalogu domowego:
mkdir -p ~/dotfiles/aplikacja/.config/aplikacja

2. Przenies plik konfiguracyjny z systemu do repozytorium:
mv ~/.config/aplikacja/plik ~/dotfiles/aplikacja/.config/aplikacja/

3. Przejdz do katalogu glownego repozytorium:
cd ~/dotfiles

4. Aktywuj dowiazania symboliczne programem stow:
stow aplikacja

## Wysylanie zmian do zdalnego repozytorium na GitHub

1. Przejdz do katalogu repozytorium:
cd ~/dotfiles

2. Dodaj zmienione i nowe pliki do poczekalni:
git add .

3. Zatwierdz zmiany komunikatem:
git commit -m "Opis wprowadzonych zmian w plikach"

4. Wyslij stan lokalny do serwera zdalnego:
git push
