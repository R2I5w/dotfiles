import { BaseConfig } from "https://deno.land/x/ddu_vim@v4.0.0/types.ts";
import { ConfigArguments } from "https://deno.land/x/ddu_vim@v4.0.0/base/config.ts";

export class Config extends BaseConfig {
        override async config(args: ConfigArguments): Promise<void> {
                args.contextBuilder.patchGlobal({
                        ui: "filer",
                        uiParams: {
                                filer: {
                                        split: "floating",
                                        floatingBorder: "rounded",
                                        winWidth: "float2nr(&columns * 0.9)",
                                        winHeight: "float2nr(&lines * 0.8)",
                                },
                                ff: {
                                        previewFloating: true,
                                        previewFloatingTitle: "Preview",
                                        previewSplit: "horizontal",
                                        prompt: "> ",
                                        split: "floating",
                                        floatingBorder: "rounded",
                                        winWidth: "float2nr(&columns * 0.9)",
                                        winHeight: "float2nr(&lines * 0.8)",
                                },
                        },
                        sourceOptions: {
                                _: {
                                        ignoreCase: true,
                                },
                                file_rec: {
                                        converters: [
                                                "converter_devicon",
                                        ],
                                        matchers: ["matcher_substring"],
                                },
                                mr: {
                                        converters: [
                                                "converter_devicon",
                                        ],
                                        matchers: ["matcher_substring"],
                                },
                                file: {
                                        columns: ["icon_filename"],
                                },
                        },
                        kindOptions: {
                                _: {
                                        defaultAction: "open",
                                },
                        },
                });

                args.contextBuilder.patchLocal("filer", {
                        sources: [
                                {
                                        name: "file",
                                },
                        ],
                        // kindOptions: {
                        //         _: {
                        //                 defaultAction: "open",
                        //         },
                        // },
                });

                args.contextBuilder.patchLocal("ff", {
                        ui: "ff",
                        sources: [
                                {
                                        name: "file_rec",
                                },
                        ],
                });

                args.contextBuilder.patchLocal("ff-mr", {
                        ui: "ff",
                        sources: [
                                {
                                        name: "mr",
                                },
                        ],
                });

                args.contextBuilder.patchLocal("ff-buffer", {
                        ui: "ff",
                        sources: [
                                {
                                        name: "buffer",
                                },
                        ],
                });
        }
}
