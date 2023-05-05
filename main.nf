#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  withLabel:otherCompute {queue = 'tower-pool-2e0IJBeFUO79g179Jybj44'}
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
