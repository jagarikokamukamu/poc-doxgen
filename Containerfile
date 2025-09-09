FROM rocky/rockylinux:8-minimal

# Install necessary packages
RUN microdnf install -y \
    gcc-c++ \
    doxygen \
    git \
    make \
    graphviz \
    gtest-devel \
    && yum clean all

# Set the working directory
WORKDIR /home/shared-work/poc-doxgen

# Copy the project files into the container
COPY . .

# Build the project
RUN make

# Set the entry point
CMD ["make", "test"]