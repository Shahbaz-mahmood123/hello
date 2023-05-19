#!/usr/bin/env nextflow
nextflow.enable.dsl=2 

process sayHello {
  label 'otherQueue'
  input: 
    val x
  output:
    stdout
  script:
    """
    echo '$x world!'
    """
    
}

process testingOtherQueue {
  label: 'secondQueue'
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
  Channel.of('Bonjour', 'Ciao', 'Hello', 'Hola', 'resume pipeline') | testingOtherQueue | view
}

process {
  withLabel: 'otherQueue' {
  queue = 'TowerForge-2MaAHE74Nnx4ZY5daq2E1v-head'
  aws.batch.schedulingPriority = 100
}
  withLabel: 'secondQueue' {
    queue = 'TowerForge-qAVkhZzpwKaUeogrDj518-work'
    aws.batch.schedulingPriority = 50
}
}