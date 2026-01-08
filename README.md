# spike_flutter

## Setup

### Geração de código para `json_serializable`

```bash
# gera código necessário para serializar as classes
dart run build_runner build --delete-conflicting-outputs

# executa um runner que constantemente gera código para serializar as classes
dart run build_runner watch --delete-conflicting-outputs
```
