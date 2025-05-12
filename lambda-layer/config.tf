locals{
    layer_definitions = [
        {
            "identifier" : "layer1"
            "description" : "Contains some python packages"
            "path" : "layers/layer1"
            "compatible_runtimes" : ["python3.8", "python3.9", "python3.10", "python3.11"]
        },
        {
            "identifier" : "layer2"
            "description" : "Contains some python packages"
            "path" : "layers/layer2"
            "compatible_runtimes" : ["python3.8", "python3.9", "python3.10", "python3.11"]
        },

    ]

    layers_info = { for i in local.layer_definitions : i.identifier => i }
}
