let i  = 0

//Função que será acionada conforme o evento do click
function exibirCarrinho(){
     //Atribui ao conteúdo do alertMessage a string com valor i
     document.getElementById("alertMessage").innerHTML = `Você possui ${i} qtd no carrinho`
     //Altera o display
     document.getElementById("customAlert").style.display = "block"
}

function hideAlert(){
    //Altera o display
    document.getElementById("customAlert").style.display = "none"
}

function adicionarCarrinho(){
    i+=1
    //Atribui ao conteúdo do alertMessage a string com valor i
    document.getElementById("alertMessage").innerHTML = `Você possui ${i} qtd no carrinho`
    document.getElementById("customAlert").style.display = "block"
}
