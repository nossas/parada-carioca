/* Use this script if you need to support IE 7 and IE 6. */

window.onload = function() {
	function addIcon(el, entity) {
		var html = el.innerHTML;
		el.innerHTML = '<span style="font-family: \'icomoon\'">' + entity + '</span>' + html;
	}
	var icons = {
			'icon-unlinked-icon' : '&#xe002;',
			'icon-underline-icon' : '&#xe00a;',
			'icon-top-guias-icon' : '&#xe000;',
			'icon-top-bairros-icon' : '&#xe00b;',
			'icon-search-icon' : '&#xe00c;',
			'icon-search-icon-2' : '&#xe00d;',
			'icon-review-icon' : '&#xe00e;',
			'icon-quotes-icon' : '&#xe00f;',
			'icon-promote-icon' : '&#xe010;',
			'icon-preview-icon' : '&#xe011;',
			'icon-photo-icon' : '&#xe012;',
			'icon-people-icon' : '&#xe013;',
			'icon-pencil-icon' : '&#xe014;',
			'icon-paradas-populares-icon' : '&#xe015;',
			'icon-novas-paradas-icon' : '&#xe017;',
			'icon-new-activity-icon' : '&#xe018;',
			'icon-money-icon' : '&#xe019;',
			'icon-mini-review-icon' : '&#xe01a;',
			'icon-list-icon' : '&#xe01b;',
			'icon-linked-icon' : '&#xe01c;',
			'icon-link-icon' : '&#xe016;',
			'icon-keywords-icon' : '&#xe001;',
			'icon-info-icon' : '&#xe01d;',
			'icon-heart-icon' : '&#xe01e;',
			'icon-event-list-icon' : '&#xe01f;',
			'icon-create-icon' : '&#xe020;',
			'icon-close-icon' : '&#xe021;',
			'icon-clock-icon' : '&#xe022;',
			'icon-check-icon' : '&#xe003;',
			'icon-calendar-icon' : '&#xe004;',
			'icon-calendar-add-icon' : '&#xe005;',
			'icon-bullets-icon' : '&#xe006;',
			'icon-back-icon' : '&#xe007;',
			'icon-agendamentos-icon' : '&#xe008;',
			'icon-add-icon' : '&#xe009;',
			'icon-help' : '&#xe023;',
			'icon-location' : '&#xe024;',
			'icon-facebook' : '&#xe025;',
			'icon-facebook-2' : '&#xe026;',
			'icon-phone' : '&#xe027;',
			'icon-envelope' : '&#xe028;'
		},
		els = document.getElementsByTagName('*'),
		i, attr, html, c, el;
	for (i = 0; i < els.length; i += 1) {
		el = els[i];
		attr = el.getAttribute('data-icon');
		if (attr) {
			addIcon(el, attr);
		}
		c = el.className;
		c = c.match(/icon-[^\s'"]+/);
		if (c && icons[c[0]]) {
			addIcon(el, icons[c[0]]);
		}
	}
};