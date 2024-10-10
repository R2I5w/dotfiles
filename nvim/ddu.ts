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
				sourceOptions: {
					_: {
						ignoreCase: true,
					},
				},
				kindOptions: {
					_: {
						defaultAction: "open",
					},
				},
			},
		});

		args.contextBuilder.patchLocal("filer", {
			sources: [
				{
					name: "file",
				},
			],
			sourceOptions: {
				file: {
					columns: ["icon_filename"],
				},
			},
		});

		args.contextBuilder.patchLocal("ff", {
			ui: "ff",
			sources: [
				{
					name: "file_rec",
				},
			],
			sourceOptions: {
				file_rec: {
					converters: [
						"converter_devicon",
					],
				},
			},
		});

		args.contextBuilder.patchLocal("ff-mr", {
			ui: "ff",
			sources: [
				{
					name: "mr",
				},
			],
			sourceOptions: {
				mr: {
					converters: [
						"converter_devicon",
					],
				},
			},
		});
	}
}
