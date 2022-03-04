class ZrpServices
    # Metodo intermediário para initializer dos servicos
    def self.call(*args, &block)
        new(*args, &block).call
    end
end