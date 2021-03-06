# Plugin to display virtualenv in prompt

function pshazz:virtualenv:init {
	$virtualenv = $global:pshazz.theme.virtualenv

	$global:pshazz.virtualenv = @{
		prompt_lbracket = $virtualenv.prompt_lbracket;
		prompt_rbracket = $virtualenv.prompt_rbracket;
	}
}

function global:pshazz:virtualenv:prompt {
	$vars = $global:pshazz.prompt_vars

    if($env:VIRTUAL_ENV) {
        $vars.virtualenv_lbracket = $global:pshazz.virtualenv.prompt_lbracket
        $vars.virtualenv_rbracket = $global:pshazz.virtualenv.prompt_rbracket
        $vars.virtualenv = (Get-Item $env:VIRTUAL_ENV).BaseName
    }
}
