package com.example.MCompProject.Domain;

import javax.persistence.*;

@Entity
public class ProviderAvailability {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int PAId;

    private int slotId;

    @ManyToOne
    @JoinColumn(name = "provider_id")
    private Provider provider;

    public ProviderAvailability() {}

    public ProviderAvailability(int slotId, Provider provider) {
        this.slotId = slotId;
        this.provider = provider;
    }

    public int getPAId() {
        return PAId;
    }

    public void setPAId(int PAId) {
        this.PAId = PAId;
    }

    public int getSlotId() {
        return slotId;
    }

    public void setSlotId(int slotId) {
        this.slotId = slotId;
    }

    public Provider getProvider() {
        return provider;
    }

    public void setProvider(Provider provider) {
        this.provider = provider;
    }
}
