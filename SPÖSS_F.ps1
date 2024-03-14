$name = "SPÖSS_2"
$Global:spelarpoäng = 0
$Global:datorpöang = 0

Write-Output "Välkommen att spela $name!

Skriv:
1 för Sten (Sten slår Sax och Ödla)
2 för Sax (Sax slår Papper och Ödla)
3 för Papper (Papper slår Sten och Spock)
4 för Ödla (Ödla slår Papper och Spock)
5 för Spock (Spock slår Sten och Sax)

Lycka till!
"
function fragamangd {
        $spelarval = Read-Host 'Ange tal'

        if 
        ($spelarval -ge 1 -and $spelarval -le 5) {
        valavdator        
    } 
        else {
        Write-Output "Skriv 1, 2, 3, 4 eller 5"
        fragamangd
    } 
}

function valavdator {

        $valavdator = Get-Random -Minimum 1 -Maximum 6 
        Write-Output "Dator: $valavdator"
        raknalager $spelarval $valavdator
}

function raknalager {
    param(
        [int]$spelarval,
        [int]$valavdator
    )
        if ($spelarval -eq $valavdator) {
        Write-Output "Remi!
        "
        fragamangd
    }
        elseif (($spelarval -eq 1 -and $valavdator -eq 2) -or
        ($spelarval -eq 2 -and $valavdator -eq 3) -or
        ($spelarval -eq 3 -and $valavdator -eq 1) -or
        ($spelarval -eq 4 -and $valavdator -eq 3) -or
        ($spelarval -eq 5 -and $valavdator -eq 1) -or
        ($spelarval -eq 1 -and $valavdator -eq 4) -or
        ($spelarval -eq 2 -and $valavdator -eq 4) -or
        ($spelarval -eq 3 -and $valavdator -eq 5) -or
        ($spelarval -eq 4 -and $valavdator -eq 5) -or
        ($spelarval -eq 5 -and $valavdator -eq 2)) {   
        $Global:spelarpoäng++
        Write-Output "Du vann!" 
        Write-Host -f Yellow "Resultat: $Global:spelarpoäng - $Global:datorpöang
        "
        resultat
    }
        else {
        $Global:datorpöang++
        Write-Output "Du förlorade!"
        Write-Host -f Yellow "Resultat: $Global:spelarpoäng - $Global:datorpöang
        "
        resultat
    }
}

function resultat {

    if 
    (($Global:spelarpoäng -eq 5 -and $Global:datorpöang -lt 1) -or
    ($Global:spelarpoäng -eq 4 -and $Global:datorpöang -eq 1) -or
    ($Global:spelarpoäng -eq 3 -and $Global:datorpöang -eq 2)) {
    Write-Host -f yellow "Grattis, du vann! Resultat: $Global:spelarpoäng - $Global:datorpöang"
    fortsatt
}
    elseif 
    (($Global:datorpöang -eq 5 -and $Global:spelarpoäng -lt 1) -or
    ($Global:datorpöang -eq 4 -and $Global:spelarpoäng -eq 1) -or
    ($Global:datorpöang -eq 3 -and $Global:spelarpoäng -eq 2)) {
    Write-Host -f yellow "Tyvärr, förlorade du. Resultat: $Global:spelarpoäng - $Global:datorpöang"
    fortsatt
}   
    elseif 
    (($Global:spelarpoäng -lt 5 -and $Global:datorpöang -lt 3) -or 
    ($Global:datorpöang -lt 5 -and $Global:spelarpoäng -lt 3)) {
    fragamangd
}      
}
function fortsatt {

        $fraga = Read-Host "Vill du spela igen (Y/N)?"
        if($fraga -eq "Y") {
        $Global:spelarpoäng = 0
        $Global:datorpöang = 0
        fragamangd 
    }
        elseif ($fraga -eq "N"){ 
        Write-Output "Tack för spel, välkommen åter!"
        break 
    }
        else {
        Write-Output "Svara y eller n"
        fortsatt
    }
}
fragamangd