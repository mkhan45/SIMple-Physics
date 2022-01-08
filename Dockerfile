FROM elixir:latest

COPY SIMple-Physics base_site
WORKDIR base_site

RUN mix local.hex --force
RUN mix deps.get
RUN mix local.rebar --force
RUN mix deps.compile

RUN apt update -y
RUN apt install -y nodejs
RUN apt install -y npm
RUN npm install -y -g tailwindcss

CMD cd /site && \
    cp -r /base_site/deps /site && \
    env BASE_URL="https://simp.mikail-khan.com" mix gen_site

# Run with: docker run --mount type=bind,source="$(pwd)/SIMple-Physics",target="/site" -t simp_site
