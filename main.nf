#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  label 'otherCompute'
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
    
}

workflow {
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'resume pipeline') | sayHello | view
}

