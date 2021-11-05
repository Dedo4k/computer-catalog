package iipu.shop.model.component;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "graphics_card")
@ToString(callSuper = true)
@EqualsAndHashCode(callSuper = true)
public class GraphicsCard extends Component{

    @Column(name = "gpu_producer", nullable = false)
    private String gpuProducer;

    @Column(name = "gpu_model", nullable = false)
    private String gpuModel;

    @Column(name = "video_memory", nullable = false)
    private int videoMemory;

    @Column(name = "video_memory_type", nullable = false)
    private String videoMemoryType;

    @Override
    public String toString() {
        return getProducer() + " " + gpuProducer + " " + gpuModel + " " + getModel();
    }

    @Override
    public String info() {
        return videoMemory + ", " + videoMemoryType;
    }
}
