PANDOC = pandoc
TEMPLATE_PATH = ./template.tex
PDF_ENGINE = tectonic
MMDC ?= mmdc

NAME = 2023_TD_Pizzi
EXT = pdf

SOURCES_DIR = ./src/
RESOURCE_PATH = .
RESOURCE_DIR = resources

SOURCES = 00_info.md \
					01_intro.md \
					02_back.md \
					03_front.md \
					04_tpe.md \
					05_organization.md

SRC_MERMAID = project-arch.mmd
DIR_MERMAID = $(RESOURCE_DIR)/mermaid

OBJ_MERMAID 	=	$(addprefix $(DIR_MERMAID)/, $(SRC_MERMAID:.mmd=.png))

MERMAID_OPTION =

ifdef PUPPETEER_CFG_PATH
	MERMAID_OPTION := -p $(PUPPETEER_CFG_PATH)
endif

%.png : %.mmd
	@$(MMDC) -i $< -o $@ -b transparent $(MERMAID_OPTION)

PANDOC_METADATA_OPTIONS = --metadata date="`date -u '+%d / %m / %Y'`"
PANDOC_OPTIONS = --resource-path $(RESOURCE_PATH) --template $(TEMPLATE_PATH) $(PANDOC_METADATA_OPTIONS) --highlight-style pygments

$(NAME): $(OBJ_MERMAID)
	@$(PANDOC) $(addprefix $(SOURCES_DIR), $(SOURCES)) -o $(NAME).$(EXT) --pdf-engine $(PDF_ENGINE) $(PANDOC_OPTIONS)

all: $(NAME)

clean:
	@rm -f $(NAME).$(EXT)
