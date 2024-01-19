# パラメータ定義
$Password = "Passw0rd!"
$DNS = "komanai.com"
$CertStore = "cert:\CurrentUser\My"
$pfxOutPath = "$PSScriptRoot\mycert.pfx"
$cerOutPath = "$PSScriptRoot\mycert.cer"

# 証明書作成
$limit = (Get-Date).AddYears(1)
$myCert = New-SelfSignedCertificate -KeySpec KeyExchange -NotAfter $limit -DnsName $DNS -CertStoreLocation $CertStore

# 証明書出力
$secure = ConvertTo-SecureString $Password -AsPlainText -Force
$myCert | Export-PfxCertificate -FilePath $pfxOutPath -Password $secure
$myCert | Export-Certificate -FilePath $cerOutPath

# 拇印の確認
$myCert | Select-Object Thumbprint