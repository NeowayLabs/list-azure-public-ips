FROM microsoft/azure-cli:2.0.29

COPY bin/ /listazurepublicips

WORKDIR /listazurepublicips

ENTRYPOINT ["bash"]
