STYLES = ./public/css/styles.css
STYLES_MIN = ./public/css/styles.min.css
STYLES_LESS = ./upstreams/bootstrap/less/styles.less

RESPONSIVE = ./public/css/responsive.css
RESPONSIVE_MIN = ./public/css/responsive.min.css
RESPONSIVE_LESS = ./upstreams/bootstrap/less/responsive.less

#
# recess is required
#

styles:
	mkdir -p public/img
	mkdir -p public/css
	mkdir -p public/font
	cp upstreams/bootstrap/img/* public/img/
	cp upstreams/font-awesome/font/* public/font
	cp upstreams/font-awesome/less/font-awesome.less upstreams/bootstrap/less/
# styles.less and custom_variables.less is intended to copied there, so that we don't have to type long import paths
	cp views/styles/styles.less upstreams/bootstrap/less/
	cp views/styles/custom_variables.less upstreams/bootstrap/less/

	recess --compile ${STYLES_LESS} > ${STYLES}
	recess --compress ${STYLES_LESS} > ${STYLES_MIN}
	recess --compile ${RESPONSIVE_LESS} > ${RESPONSIVE}
	recess --compress ${RESPONSIVE_LESS} > ${RESPONSIVE_MIN}
