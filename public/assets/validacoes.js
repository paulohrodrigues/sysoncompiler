function valida(){
		alert(document.getElementById("valorSaque").value);
		if(document.getElementById("valorSaque").value<50){
			alert("Valor minimo para saque é de R$ 50.00");
			return false;
		}else if(document.getElementById("valorSaque").value>{{item.valor_saque}}){
			alert("Você não tem esse saldo");
			return false;
		}
		return true;
	}