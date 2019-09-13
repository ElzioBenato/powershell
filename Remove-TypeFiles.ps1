<#
.DESCRIPTION
 Funcao remove os arquivos 
.PARAMETER Path

.PARAMETER FileType

.EXAMPLE
Remove-Filetypes -Path C:\temp -FileType *.txt,*.iso,*test,*.bak
#>
function Remove-FileTypes {
    [CmdletBinding()]
    param
     (
        [Parameter(Mandatory=$true)]
            [String]
            $Path,
                        
            [Parameter(ParameterSetName='FileType')]
            [Array]
            $FileType
    )
    
    
        if ([string]::IsNullOrEmpty($FileType)) {
           Get-ChildItem -Path $Path
           Write-Host "So vai remover os arquivos se expecificar o Paremetro -FileType"
        } else {

            for ($i = 0; $i -le ($FileType.length - 1); $i += 1) {
                $p = $FileType[$i].ToString()
                $Files = Get-ChildItem  -Path $Path -Filter $p
            
                    if ([string]::IsNullOrEmpty($Files)) {
                        Write-Host "Nao possui arquivos : $($Path, $p)" -ForegroundColor "Green"
                    } else {
                             for ($t = 0; $t -le ($Files.length - 1); $t += 1){
                                $Remove = $Files[$t]
                                write-host "Deletando arquivo $($Remove.FullName)" -ForegroundColor "DarkRed"
                                Remove-Item -Path $Remove.FullName 
                                }
                
                            }
            
            }
            
        }

}