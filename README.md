# Docker Spring Initializr

Docker version of [Spring Initializr](https://start.spring.io)

## Usage

**Docker Compose**

```yaml
version: "3"
services:
  initializr:
    build:
      context: .
    image: docker.io/kuzoncby/spring-initializr:latest
    ports:
      - "8080:8080"

```

Launch web console:

```bash
docker-compose up -d
```

Open your browser and access http://127.0.0.1:8080

## See also

- Spring Initializr official web site: https://start.spring.io
- OpenShift Template: [spring-initializr.template.yaml](spring-initializr.template.yaml)

## License

MIT