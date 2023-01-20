import defaultTheme from "tailwindcss/defaultTheme.js";
// @ts-ignore
import nordPlugin from "tailwind-nord";

/** @type {import('tailwindcss').Config} */
export default {
	content: ["./src/**/*.{js,ts,tsx,jsx,astro}"],
	theme: {
		extend: {
			fontFamily: {
				sans: ["Nunito", ...defaultTheme.fontFamily.sans],
			},
		},
		screens: {
			phone: "480px",
			tablet: "640px",
			laptop: "1024px",
			desktop: "1280px",
		},
	},
	variants: {
		extend: {
			visibility: ["group-hover"],
		},
	},
	plugins: [nordPlugin],
};
