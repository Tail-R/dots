using CustomApp;
using CustomWidgets;

int main(string[] args) {
    // UI
    UIBuilder ub = () => {
        // Memory
        var mem_scale = new MyScale(H, 0, 0, 100, "mem-scale")
            .poll_value_sync(1000, "scripts/get_mem_usage.sh");

        var mem_level = new MyLabel("0", "level")
            .poll_command_sync(100, "scripts/get_mem_usage.sh");

        // Battery
        var bat_scale = new MyScale(H, 0, 0, 100, "bat-scale")
            .poll_value_sync(1000, "scripts/get_bat_level.sh");

        var bat_level = new MyLabel("0", "level")
            .poll_command_sync(100, "scripts/get_bat_level.sh");

        // Volume
        var vol_scale = new MyScale(H, 0, 0, 100, "vol-scale")
            .poll_value_sync(1000, "scripts/get_vol_level.sh");

        var vol_level = new MyLabel("0", "level")
            .poll_command_sync(100, "scripts/get_vol_level.sh");

        // Brightness
        var bri_scale = new MyScale(H, 0, 0, 100, "bri-scale")
            .poll_value_sync(1000, "scripts/get_brightness.sh");

        var bri_level = new MyLabel("0", "level")
            .poll_command_sync(100, "scripts/get_brightness.sh");

        var gap_size = 12;

        return new MyBox(V, "root-box").pack(
            new Cerberus(
                H, "memory",
                new MyBox(H).pack(
                    new MyBox(V, "icon"),
                    new MyBox(V).pack(
                        new MyLabel("Memory", "title"),
                        new MyBox(H).pack(
                            mem_level,
                            new MyLabel("/100%", "tail")
                        ),
                        new Spacer(V)
                    )
                ),
                mem_scale
            ).expand_v(false).gap(gap_size),
            new Cerberus(
                H, "battery",
                new MyBox(H).pack(
                    new MyBox(V, "icon"),
                    new MyBox(V).pack(
                        new MyLabel("Battery", "title"),
                        new MyBox(H).pack(
                            bat_level,
                            new MyLabel("/100%", "tail")
                        ),
                        new Spacer(V)
                    )
                ),
                bat_scale
            ).expand_v(false).gap(gap_size),
            new Cerberus(
                H, "volume",
                new MyBox(H).pack(
                    new MyBox(V, "icon"),
                    new MyBox(V).pack(
                        new MyLabel("Volume", "title"),
                        new MyBox(H).pack(
                            vol_level,
                            new MyLabel("/100%", "tail")
                        ),
                        new Spacer(V)
                    )
                ),
                vol_scale
            ).expand_v(false).gap(gap_size),
            new Cerberus(
                H, "brightness",
                new MyBox(H).pack(
                    new MyBox(V, "icon"),
                    new MyBox(V).pack(
                        new MyLabel("Brightness", "title"),
                        new MyBox(H).pack(
                            bri_level,
                            new MyLabel("/100%", "tail")
                        ),
                        new Spacer(V)
                    )
                ),
                bri_scale
            ).expand_v(false).gap(gap_size)
        );
    };

    // Window
    var config = new WindowConfig(
        "System Monitor",
        100,
        100,
        true, // resizable
        ub
    );

    var app = new MyApp(config);

    return app.run(args);
}

