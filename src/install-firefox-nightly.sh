#!/bin/bash

UNINSTALL=false

usage() {
    echo "Usage:"
    echo "  install-firefox-nightly.sh [options]"
    echo ""
    echo "Options:"
    echo "  -r, --remove  Remove Firefox Nightly from your system."
    echo "  -h, --help    Show help information."
    echo ""
}

install() {
    echo "Downloading..."
    curl --silent "https://download-installer.cdn.mozilla.net/pub/firefox/nightly/latest-mozilla-central/firefox-90.0a1.en-US.linux-x86_64.tar.bz2" --output /tmp/firefox-nightly.tar.bz2

    echo "Extracting..."
    mkdir -p /tmp/firefox-nightly
    tar xf /tmp/firefox-nightly.tar.bz2 --directory /tmp/firefox-nightly

    echo "Installing..."
    mkdir -p /opt/firefox-nightly/
    cp -r /tmp/firefox-nightly/firefox/* /opt/firefox-nightly/
    ln -sf /opt/firefox-nightly/firefox /usr/bin/firefox-nightly
    echo -e "[Desktop Entry]\nVersion=1.0\nName=Firefox Nightly\nGenericName=Web Browser\nGenericName[ca]=Navegador web\nGenericName[cs]=Webový prohlížeč\nGenericName[es]=Navegador web\nGenericName[fa]=مرورگر اینترنتی\nGenericName[fi]=WWW-selain\nGenericName[fr]=Navigateur Web\nGenericName[hu]=Webböngésző\nGenericName[it]=Browser Web\nGenericName[ja]=ウェブ・ブラウザ\nGenericName[ko]=웹 브라우저\nGenericName[nb]=Nettleser\nGenericName[nl]=Webbrowser\nGenericName[nn]=Nettlesar\nGenericName[no]=Nettleser\nGenericName[pl]=Przeglądarka WWW\nGenericName[pt]=Navegador Web\nGenericName[pt_BR]=Navegador Web\nGenericName[sk]=Internetový prehliadač\nGenericName[sv]=Webbläsare\nComment=Browse the Web\nComment[ca]=Navegueu per el web\nComment[cs]=Prohlížení stránek World Wide Webu\nComment[de]=Im Internet surfen\nComment[es]=Navegue por la web\nComment[fa]=صفحات شبکه جهانی اینترنت را مرور نمایید\nComment[fi]=Selaa Internetin WWW-sivuja\nComment[fr]=Navigue sur Internet\nComment[hu]=A világháló böngészése\nComment[it]=Esplora il web\nComment[ja]=ウェブを閲覧します\nComment[ko]=웹을 돌아 다닙니다\nComment[nb]=Surf på nettet\nComment[nl]=Verken het internet\nComment[nn]=Surf på nettet\nComment[no]=Surf på nettet\nComment[pl]=Przeglądanie stron WWW\nComment[pt]=Navegue na Internet\nComment[pt_BR]=Navegue na Internet\nComment[sk]=Prehliadanie internetu\nComment[sv]=Surfa på webben\nExec=/opt/firefox-nightly/firefox %u\nIcon=/opt/firefox-nightly/browser/chrome/icons/default/default128.png\nTerminal=false\nType=Application\nMimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;\nStartupNotify=true\nCategories=Network;WebBrowser;\nKeywords=web;browser;internet;\nActions=new-window;new-private-window;profile-manager-window;\nX-Desktop-File-Install-Version=0.26\n[Desktop Action new-window]\nName=Open a New Window\nName[ach]=Dirica manyen\nName[af]=Nuwe venster\nName[an]=Nueva finestra\nName[ar]=نافذة جديدة\nName[as]=নতুন উইন্ডো\nName[ast]=Ventana nueva\nName[az]=Yeni Pəncərə\nName[be]=Новае акно\nName[bg]=Нов прозорец\nName[bn_BD]=নতুন উইন্ডো (N)\nName[bn_IN]=নতুন উইন্ডো\nName[br]=Prenestr nevez\nName[brx]=गोदान उइन्ड'(N)\nName[bs]=Novi prozor\nName[ca]=Finestra nova\nName[cak]=K'ak'a' tzuwäch\nName[cs]=Nové okno\nName[cy]=Ffenestr Newydd\nName[da]=Nyt vindue\nName[de]=Neues Fenster\nName[dsb]=Nowe wokno\nName[el]=Νέο παράθυρο\nName[en_GB]=New Window\nName[en_US]=New Window\nName[en_ZA]=New Window\nName[eo]=Nova fenestro\nName[es_AR]=Nueva ventana\nName[es_CL]=Nueva ventana\nName[es_ES]=Nueva ventana\nName[es_MX]=Nueva ventana\nName[et]=Uus aken\nName[eu]=Leiho berria\nName[fa]=پنجره جدید‌\nName[ff]=Henorde Hesere\nName[fi]=Uusi ikkuna\nName[fr]=Nouvelle fenêtre\nName[fy_NL]=Nij finster\nName[ga_IE]=Fuinneog Nua\nName[gd]=Uinneag ùr\nName[gl]=Nova xanela\nName[gn]=Ovetã pyahu\nName[gu_IN]=નવી વિન્ડો\nName[he]=חלון חדש\nName[hi_IN]=नया विंडो\nName[hr]=Novi prozor\nName[hsb]=Nowe wokno\nName[hu]=Új ablak\nName[hy_AM]=Նոր Պատուհան\nName[id]=Jendela Baru\nName[is]=Nýr gluggi\nName[it]=Nuova finestra\nName[ja]=新しいウィンドウ\nName[ja_JP-mac]=新規ウインドウ\nName[ka]=ახალი ფანჯარა\nName[kk]=Жаңа терезе\nName[km]=បង្អួច​​​ថ្មី\nName[kn]=ಹೊಸ ಕಿಟಕಿ\nName[ko]=새 창\nName[kok]=नवें जनेल\nName[ks]=نئئ وِنڈو\nName[lij]=Neuvo barcon\nName[lo]=ຫນ້າຕ່າງໃຫມ່\nName[lt]=Naujas langas\nName[ltg]=Jauns lūgs\nName[lv]=Jauns logs\nName[mai]=नव विंडो\nName[mk]=Нов прозорец\nName[ml]=പുതിയ ജാലകം\nName[mr]=नवीन पटल\nName[ms]=Tetingkap Baru\nName[my]=ဝင်းဒိုးအသစ်\nName[nb_NO]=Nytt vindu\nName[ne_NP]=नयाँ सञ्झ्याल\nName[nl]=Nieuw venster\nName[nn_NO]=Nytt vindauge\nName[or]=ନୂତନ ୱିଣ୍ଡୋ\nName[pa_IN]=ਨਵੀਂ ਵਿੰਡੋ\nName[pl]=Nowe okno\nName[pt_BR]=Nova janela\nName[pt_PT]=Nova janela\nName[rm]=Nova fanestra\nName[ro]=Fereastră nouă\nName[ru]=Новое окно\nName[sat]=नावा विंडो (N)\nName[si]=නව කවුළුවක්\nName[sk]=Nové okno\nName[sl]=Novo okno\nName[son]=Zanfun taaga\nName[sq]=Dritare e Re\nName[sr]=Нови прозор\nName[sv_SE]=Nytt fönster\nName[ta]=புதிய சாளரம்\nName[te]=కొత్త విండో\nName[th]=หน้าต่างใหม่\nName[tr]=Yeni pencere\nName[tsz]=Eraatarakua jimpani\nName[uk]=Нове вікно\nName[ur]=نیا دریچہ\nName[uz]=Yangi oyna\nName[vi]=Cửa sổ mới\nName[wo]=Palanteer bu bees\nName[xh]=Ifestile entsha\nName[zh_CN]=新建窗口\nName[zh_TW]=開新視窗\nExec=/opt/firefox-nightly/firefox --new-window %u\n[Desktop Action new-private-window]\nName=Open a New Private Window\nName[ach]=Dirica manyen me mung\nName[af]=Nuwe privaatvenster\nName[an]=Nueva finestra privada\nName[ar]=نافذة خاصة جديدة\nName[as]=নতুন ব্যক্তিগত উইন্ডো\nName[ast]=Ventana privada nueva\nName[az]=Yeni Məxfi Pəncərə\nName[be]=Новае акно адасаблення\nName[bg]=Нов прозорец за поверително сърфиране\nName[bn_BD]=নতুন ব্যক্তিগত উইন্ডো\nName[bn_IN]=নতুন ব্যক্তিগত উইন্ডো\nName[br]=Prenestr merdeiñ prevez nevez\nName[brx]=गोदान प्राइभेट उइन्ड'\nName[bs]=Novi privatni prozor\nName[ca]=Finestra privada nova\nName[cak]=K'ak'a' ichinan tzuwäch\nName[cs]=Nové anonymní okno\nName[cy]=Ffenestr Breifat Newydd\nName[da]=Nyt privat vindue\nName[de]=Neues privates Fenster\nName[dsb]=Nowe priwatne wokno\nName[el]=Νέο παράθυρο ιδιωτικής περιήγησης\nName[en_GB]=New Private Window\nName[en_US]=New Private Window\nName[en_ZA]=New Private Window\nName[eo]=Nova privata fenestro\nName[es_AR]=Nueva ventana privada\nName[es_CL]=Nueva ventana privada\nName[es_ES]=Nueva ventana privada\nName[es_MX]=Nueva ventana privada\nName[et]=Uus privaatne aken\nName[eu]=Leiho pribatu berria\nName[fa]=پنجره ناشناس جدید\nName[ff]=Henorde Suturo Hesere\nName[fi]=Uusi yksityinen ikkuna\nName[fr]=Nouvelle fenêtre de navigation privée\nName[fy_NL]=Nij priveefinster\nName[ga_IE]=Fuinneog Nua Phríobháideach\nName[gd]=Uinneag phrìobhaideach ùr\nName[gl]=Nova xanela privada\nName[gn]=Ovetã ñemi pyahu\nName[gu_IN]=નવી ખાનગી વિન્ડો\nName[he]=חלון פרטי חדש\nName[hi_IN]=नयी निजी विंडो\nName[hr]=Novi privatni prozor\nName[hsb]=Nowe priwatne wokno\nName[hu]=Új privát ablak\nName[hy_AM]=Սկսել Գաղտնի դիտարկում\nName[id]=Jendela Mode Pribadi Baru\nName[is]=Nýr huliðsgluggi\nName[it]=Nuova finestra anonima\nName[ja]=新しいプライベートウィンドウ\nName[ja_JP-mac]=新規プライベートウインドウ\nName[ka]=ახალი პირადი ფანჯარა\nName[kk]=Жаңа жекелік терезе\nName[km]=បង្អួច​ឯកជន​ថ្មី\nName[kn]=ಹೊಸ ಖಾಸಗಿ ಕಿಟಕಿ\nName[ko]=새 사생활 보호 모드\nName[kok]=नवो खाजगी विंडो\nName[ks]=نْو پرایوٹ وینڈو&amp;\nName[lij]=Neuvo barcon privou\nName[lo]=ເປີດຫນ້າຕ່າງສວນຕົວຂື້ນມາໃຫມ່\nName[lt]=Naujas privataus naršymo langas\nName[ltg]=Jauns privatais lūgs\nName[lv]=Jauns privātais logs\nName[mai]=नया निज विंडो (W)\nName[mk]=Нов приватен прозорец\nName[ml]=പുതിയ സ്വകാര്യ ജാലകം\nName[mr]=नवीन वैयक्तिक पटल\nName[ms]=Tetingkap Persendirian Baharu\nName[my]=New Private Window\nName[nb_NO]=Nytt privat vindu\nName[ne_NP]=नयाँ निजी सञ्झ्याल\nName[nl]=Nieuw privévenster\nName[nn_NO]=Nytt privat vindauge\nName[or]=ନୂତନ ବ୍ୟକ୍ତିଗତ ୱିଣ୍ଡୋ\nName[pa_IN]=ਨਵੀਂ ਪ੍ਰਾਈਵੇਟ ਵਿੰਡੋ\nName[pl]=Nowe okno prywatne\nName[pt_BR]=Nova janela privativa\nName[pt_PT]=Nova janela privada\nName[rm]=Nova fanestra privata\nName[ro]=Fereastră privată nouă\nName[ru]=Новое приватное окно\nName[sat]=नावा निजेराक् विंडो (W )\nName[si]=නව පුද්ගලික කවුළුව (W)\nName[sk]=Nové okno v režime Súkromné prehliadanie\nName[sl]=Novo zasebno okno\nName[son]=Sutura zanfun taaga\nName[sq]=Dritare e Re Private\nName[sr]=Нови приватан прозор\nName[sv_SE]=Nytt privat fönster\nName[ta]=புதிய தனிப்பட்ட சாளரம்\nName[te]=కొత్త ఆంతరంగిక విండో\nName[th]=หน้าต่างส่วนตัวใหม่\nName[tr]=Yeni gizli pencere\nName[tsz]=Juchiiti eraatarakua jimpani\nName[uk]=Приватне вікно\nName[ur]=نیا نجی دریچہ\nName[uz]=Yangi maxfiy oyna\nName[vi]=Cửa sổ riêng tư mới\nName[wo]=Panlanteeru biir bu bees\nName[xh]=Ifestile yangasese entsha\nName[zh_CN]=新建隐私浏览窗口\nName[zh_TW]=新增隱私視窗\nExec=/opt/firefox-nightly/firefox --private-window %u\n[Desktop Action profile-manager-window]\nName=Open the Profile Manager\nName[cs]=Správa profilů\nExec=/opt/firefox-nightly/firefox --ProfileManager" >/usr/share/applications/firefox-nightly.desktop

    echo "Cleaning up..."
    rm -r /tmp/firefox-nightly.tar.bz2
    rm -r /tmp/firefox-nightly

    echo "Done!"
}

remove() {
    echo "Removing..."

    if [ -d /opt/firefox-nightly ]; then
        rm -r /opt/firefox-nightly
    fi

    if [ -f /usr/share/applications/firefox-nightly.desktop ]; then
        rm /usr/share/applications/firefox-nightly.desktop
    fi

    if [ -L /usr/bin/firefox-nightly ]; then
        unlink /usr/bin/firefox-nightly
    fi

    echo "Done!"
}

main() {
    while [ "$1" != "" ]; do
        case $1 in
        -h | --help)
            usage
            exit 0
            ;;
        -r | --remove)
            UNINSTALL=true
            ;;
        *)
            usage
            exit 1
            ;;
        esac
        shift
    done

    if [ "$(id -u)" -ne 0 ]; then
        echo "Error: This command has to be run with superuser privileges (under the root user on most systems)." >&2
        exit 1
    fi

    if [ "$UNINSTALL" = "true" ]; then
        remove
    else
        install
    fi
}

main "$@"
